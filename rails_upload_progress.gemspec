# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails_upload_progress}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Benjamin LAN SUN LUK"]
  s.date = %q{2010-03-18}
  s.description = %q{RailsUploadProgress help you to easily create an AJAX upload progress bar with Prototype JavaScript framework on nginx hosted applications.}
  s.email = %q{}
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/app/helpers/rails_upload_progress_helper.rb", "lib/rails_upload_progress.rb"]
  s.files = ["CHANGELOG", "MIT-LICENSE", "README.rdoc", "Rakefile", "VERSION", "init.rb", "lib/app/helpers/rails_upload_progress_helper.rb", "lib/rails_upload_progress.rb", "Manifest", "rails_upload_progress.gemspec"]
  s.homepage = %q{http://github.com/NebJ/rails_upload_progress}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rails_upload_progress", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rails_upload_progress}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{RailsUploadProgress help you to easily create an AJAX upload progress bar with Prototype JavaScript framework on nginx hosted applications.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
