class Developer
attr_reader :name, :task_list, :prof
MAX_TASKS=10
PROF = :developer
TEAM = :developers
  def initialize(name)
    @name = name
    @task_list = []
    @prof = prof  
    @team = team  
  end


  def status
    case 
    when @task_list.count == 0
      'свободен'
    when @task_list.count > 0 && @task_list.count < MAX_TASKS
      'работаю'
    else
      'занят'
    end
  end

  def add_task(task)
    raise(ArgumentError) if @task_list.count >= MAX_TASKS
    @task_list << task
    puts "#{@name}: добавлена задача \"#{task}\". Всего в списке задач: #{@task_list.count}"
    rescue ArgumentError
    puts "Слишком много работы!"
  end

  def tasks
    @task_list.each_with_index{|el, index| puts "#{index += 1}. #{el}"} 
  end

  def work!
    if @task_list.first == nil
      raise ArgumentError, "Нечего делать!"
    else
      print "#{@name}: выполнена задача \"#{@task_list.first}\". "
      @task_list.delete_at(0)
      puts "Осталось задач: #{@task_list.count}"
    end
  end

  def prof
    self.class::PROF
  end

  def team
    self.class::TEAM
  end

  def can_add_task?
    if @task_list.count >= MAX_TASKS
      false
    else
      true
    end
  end

  def can_work?
    if @task_list.count == 0
      false
    else
      true
    end
  end
end

class JuniorDeveloper < Developer
  MAX_TASKS=5
  PROF = :junior
  def add_task(task)
    
    raise(ArgumentError, 'Слишком много работы!') if @task_list.count >= MAX_TASKS
    raise(ArgumentError, 'Слишком сложно!') if task.size > 20
    @task_list << task
    puts "#{@name}: добавлена задача \"#{task}\". Всего в списке задач: #{@task_list.count}"
  end

  def work!
    if @task_list.first == nil
      raise ArgumentError, "Нечего делать!"
    else
      print "#{@name}: пытаюсь делать задачу \"#{@task_list.first}\". "
      @task_list.delete_at(0)
      puts "Осталось задач: #{@task_list.count}"
    end
  end

  def status
    case 
    when @task_list.count == 0
      'свободен'
    when @task_list.count > 0 && @task_list.count < MAX_TASKS
      'работаю'
    else
      'занят'
    end
  end

  def can_add_task?
    if @task_list.count >= MAX_TASKS
      false
    else
      true
    end
  end
end


class SeniorDeveloper < Developer

  MAX_TASKS=15
  PROF = :senior
  def add_task(task)
    raise(ArgumentError, 'Слишком много работы!') if @task_list.count >= MAX_TASKS
    @task_list << task
    puts "#{@name}: добавлена задача \"#{task}\". Всего в списке задач: #{@task_list.count}"
  end

  def work!
    case
      when @task_list.first == nil
        raise ArgumentError, "Нечего делать!"
      when [true, false].sample == true
        print "#{@name}: выполнена задача \"#{@task_list.first}\". "
        @task_list.delete_at(0)
        puts "Осталось задач: #{@task_list.count}"
        print "#{@name}: выполнена задача \"#{@task_list.first}\". "
        @task_list.delete_at(0)
        puts "Осталось задач: #{@task_list.count}"
      else
        puts "Что-то лень"
    end
  end

  def status
    case 
    when @task_list.count == 0
      'свободен'
    when @task_list.count > 0 && @task_list.count < MAX_TASKS
      'работаю'
    else
      'занят'
    end
  end

  def can_add_task?
    if @task_list.count >= MAX_TASKS
      false
    else
      true
    end
  end
end
