class Developer
MAX_TASKS=10
  def initialize(name)
    @name = name
    @task_list = []    
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
      print "#{@name}: пытаюсь деелать задачу \"#{@task_list.first}\". "
      @task_list.delete_at(0)
      puts "Осталось задач: #{@task_list.count}"
    end
  end
end


class SeniorDeveloper < Developer
  MAX_TASKS=15

  def add_task(task)
    raise(ArgumentError) if @task_list.count >= MAX_TASKS
    @task_list << task
    puts "#{@name}: добавлена задача \"#{task}\". Всего в списке задач: #{@task_list.count}"
    rescue ArgumentError
    puts "Слишком много работы!"
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
end


dev = Developer.new('Вася')
jun = JuniorDeveloper.new('Вася')
sen = SeniorDeveloper.new('Вася')
sen.add_task('Передвинуть шкаф')
#sen.add_task('Полить кактус')
#sen.add_task('Попить кофе')
#sen.add_task('Запрограммировать калькулятор')
#sen.add_task('Попить чай')
#sen.add_task('Дать задание джунам')
#sen.add_task('Оформить отпуск')
#sen.add_task('Дать задание тестировщикам')
#sen.add_task('Запрограммировать калькулятор')
#sen.add_task('Попить кофе')
#sen.add_task('Попросить Васю полить кактус')
dev.add_task('Попить кофе')
dev.add_task('Полить кактус')
dev.add_task('Попить кофе')
dev.add_task('Полить кактус')
#jun.add_task('Попить кофе')
#jun.add_task('Попить кофе')
#jun.add_task('Попить кофе')
#jun.add_task('Попить кофе')
#jun.add_task('Попить кофе')
dev.tasks
#sen.work!
#sen.work!
#sen.work!
#sen.work!
#sen.work!
#sen.work!
#jun.work!
#puts dev.status
#puts "Еще есть место для заданий" if dev.can_add_task? == true
#puts "Слишком занят, задания не принимаю" if dev.can_add_task? == false
#puts "Нет заданий" if dev.can_work? == false
#jun.add_task('Попить кофе после длинного рабочего дня')