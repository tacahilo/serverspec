module Serverspec
  module Commands
    class Debian < Linux
      def check_enabled service
        # Until everything uses Upstart, this needs an OR.
        "ls /etc/rc3.d/ | grep -- #{escape(service)} || grep 'start on' /etc/init/#{escape(service)}.conf"      
      end

      def check_installed package
        "dpkg -s #{escape(package)}"
      end

      def check_running service
        # This is compatible with Debian >Jaunty and Ubuntu derivatives
        "service #{escape(service)} status | grep 'running'"
      end
    end
  end
end
