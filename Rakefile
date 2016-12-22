
# http://www.virtuouscode.com/2014/04/23/rake-part-3-rules/
source_files = Rake::FileList.new('**/*.md', '**/*.markdown') do |f1|
  # f1.exclude('~*')
  # f1.exclude(%r{^scratch/})
  # f1.exclude do |f|
  #   'git ls-files #{f}'.empty?
  # end
end

task default: :html
task html: source_files.ext('.html')

rule '.html' => '.md' do |t|
  sh "pandoc -o #{t.name} #{t.source}"
end

rule '.html' => '.markdown' do |t|
  sh "pandoc -o #{t.name} #{t.source}"
end
