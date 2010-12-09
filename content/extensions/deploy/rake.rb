require 'rubygems'
require 'net/ssh/multi'

namespace :deploy do
  
  task :staging do
    opts = {
      :gateway => nil,
      :servers => %w( deploy@staging.com )
    }
    gather_deploy_variables
    deploy(opts)
  end
  
  task :production do
    opts = {
      :gateway => { :user => 'deploy', :ip => 'produciton.com' },
      :servers => %w( deploy@prod1 deploy@prod2 deploy@util1 deploy@util2 )
    }
    gather_deploy_variables
    deploy(opts)
  end
  
  def gather_deploy_variables
    puts
    puts "-- Setup Your Deploy --"
    puts "Hit enter for NO, and Y for yes:"
    puts
    print "Run database migrations? "
    @do_migrate = STDIN.gets.chomp == 'Y'
    if @do_migrate
      print "Disable website and show a maintenance page? "
      @do_show_maintenance = STDIN.gets.chomp == 'Y'
    else
      @do_show_maintenance = false
    end
    print "Reconfigure and reindex Sphinx? "
    @do_sphinx_rebuild = STDIN.gets.chomp == 'Y'
    puts
  end

  def deploy(opts)
    Net::SSH::Multi.start do |session|
      # access servers via a gateway
      if opts[:gateway]
        session.via(opts[:gateway][:ip], opts[:gateway][:user])
      end
      
      opts[:servers].each { |server| session.use(server) }
      
      deploy_cmd = "MIGRATE=#{@do_migrate.to_s} SHOW_MAINTENANCE=#{@do_show_maintenance.to_s} REBUILD_SPHINX=#{@do_sphinx_rebuild.to_s} bdsm deploy"

      # execute commands on remote servers
      if !remotely_exec(session, deploy_cmd)
        puts "!! Killing deploy... but not rolling anything back." and return
      end

      # run the aggregated event loop
      session.loop
    end
  end

  def remotely_exec(session, cmd)
    puts 
    puts "** [#{session.servers.join(', ')}]$ #{cmd}"
    channel = session.exec(cmd)
    channel.wait
    if channel.any? { |c| c[:exit_status] != 0 }
      puts "!! execution failed on at least one host => #{cmd}" and return false
    end
    return true
  end
  
end
