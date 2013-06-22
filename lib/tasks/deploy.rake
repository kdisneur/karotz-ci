namespace :deploy do
  desc "sync variables environment to Open Shift"
  task :sync_variables_environment do
    Net::SSH.start(ENV['host'], nil) do |ssh|
      ssh.exec('echo > ${OPENSHIFT_DATA_DIR}/.env')
      Figaro.env.each { |key, value| ssh.exec("echo 'export #{key}=#{value}' >> ${OPENSHIFT_DATA_DIR}/.env") }
      sleep 5
    end
  end
end
