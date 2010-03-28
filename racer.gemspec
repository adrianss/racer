# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{racer}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["adrianss"]
  s.date = %q{2010-02-11}
  s.description = %q{Rapid Development package for Ruby on Rails}
  s.email = %q{adrian.saz@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "generators/racer/USAGE",
     "generators/racer/racer_generator.rb",
     "lib/app/views/shared/_field.html.haml",
     "lib/dynamic_table.rb",
     "lib/racer.rb",
     "lib/racer/dyna_form_builder.rb",
     "lib/racer/dynamic_column.rb",
     "lib/racer/dynamic_table.rb",
     "lib/racer/local_dyna_form_builder.rb",
     "lib/racer_form.rb",
     "lib/racer_table.rb",
     "rails/init.rb",
     "spec/log/debug.log",
     "spec/racer_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/database.yml",
     "spec/support/racer_plugin.sqlite3.db",
     "spec/support/schema.rb"
  ]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Generators and lib for Ruby on Rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end
