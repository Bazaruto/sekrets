Capistrano::Configuration.instance(:must_exist).load do
  namespace :sekrets do
    task :upload_key do
      rails_root = File.expand_path(File.dirname(__FILE__))

      src = File.join(rails_root, '.sekrets.key')
      dst = File.join(deploy_to, 'current', '.sekrets.key')

      if test(?s, src)
        upload(src, dst, :recursive => true)
      end
    end
  end


  after "deploy", "sekrets:upload_key"
end
