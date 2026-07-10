require 'xcodeproj'

project_path = 'KODAMM.xcodeproj'
project = Xcodeproj::Project.open(project_path)
target = project.targets.first

def add_files_to_group(project, target, dir_path, group)
  Dir.entries(dir_path).each do |entry|
    next if entry == '.' or entry == '..' or entry == '.DS_Store'
    full_path = File.join(dir_path, entry)
    if File.directory?(full_path)
      sub_group = group.groups.find { |g| g.display_name == entry || g.path == entry } || group.new_group(entry, entry)
      add_files_to_group(project, target, full_path, sub_group)
    elsif entry.end_with?('.swift')
      unless group.files.any? { |f| f.path == entry || f.name == entry }
        file_ref = group.new_file(full_path)
        target.source_build_phase.add_file_reference(file_ref)
        puts "Added #{entry}"
      end
    end
  end
end

kodamm_group = project.main_group.children.find { |c| c.display_name == 'KODAMM' || c.path == 'KODAMM' }
views_group = kodamm_group.children.find { |c| c.display_name == 'Views' || c.path == 'Views' }
lab_views_group = views_group.children.find { |c| c.display_name == 'LabPortal' || c.path == 'LabPortal' } || views_group.new_group('LabPortal', 'LabPortal')

add_files_to_group(project, target, 'KODAMM/Views/LabPortal', lab_views_group)

components_group = kodamm_group.children.find { |c| c.display_name == 'Components' || c.path == 'Components' }
lab_comps_group = components_group.children.find { |c| c.display_name == 'Lab' || c.path == 'Lab' } || components_group.new_group('Lab', 'Lab')

add_files_to_group(project, target, 'KODAMM/Components/Lab', lab_comps_group)

project.save
puts "Done"
