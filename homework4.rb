require_relative 'homework3'
class Team
  attr_reader :developers, :juniors, :seniors, :all_team

  def initialize(&block)
    @all_team=[]
    instance_eval &block
  end

  def priority(*list_of_prior)
    @priority = list_of_prior
  end

    def on_task(dev_type, &block)
      save_block[dev_type] = block
    end

  def have_seniors(*names)
    names.map { |name| @all_team << SeniorDeveloper.new(name) }
  end

  def have_developers(*names)
    names.map { |name| @all_team << Developer.new(name)}
  end

  def have_juniors(*names)
   names.map { |name| @all_team << JuniorDeveloper.new(name)}
  end

  def make_dev(type, name)
    type.new(name)
  end

  def report
    dev_all.each { |dev|  puts "#{dev.name} (#{dev.prof}): #{dev.tasks}" }
  end

   def add_task(task, **options)   
    @options = options
    if @options.empty?
      dev_all.at(0).add_task(task)
    elsif @options.include?(:to)
      name = dev_all.select { |dev| @options.key(dev.name) }
      name.at(0).add_task(task)
    else
      developer = dev_all.select { |dev| @options.key(dev.prof) }
      developer.at(0).add_task(task)
    end
  end

  def on_task(prof, &block)
  end

  def dev_all
    @all_team.flatten.sort_by { |dev| [dev.tasks.size, @priority.index(dev.team)] }
  end

end

