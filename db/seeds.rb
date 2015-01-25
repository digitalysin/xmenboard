User.destroy_all
Task.destroy_all
Comment.destroy_all

xavier = User.create first_name: 'Charles', last_name: 'Xavier', email: 'xavier@xmen.com', password: 'secret1234'

wolverine = User.create first_name: 'Wolverine', email: 'wolverine@xmen.com', password: 'secret1234'
cyclops = User.create first_name: 'Cyclops', email: 'cyclops@xmen.com', password: 'secret1234'
beast = User.create first_name: 'Beast', email: 'beast@xmen.com', password: 'secret1234'

wolverine_task = xavier.task_owners.create name: 'Kidnap Magneto', description: 'Coordinate with beast to kidnap magneto', user: wolverine
beast_task = xavier.task_owners.create name: 'Hack Magneto Server', description: 'Coordinate with wolverine to hack magneto server', user: beast
cyclops_task = xavier.task_owners.create name: 'Destroy Magneto Headquarter', description: 'Coordinate with Wolverine and Beast to destroy Magneto Headquarter', user: cyclops

wolverine_task.comments.create body: 'wakarimasu', user: wolverine
beast_task.comments.create body: 'roger that!', user: beast
cyclops_task.comments.create body: '86!', user: cyclops

users = [xavier, wolverine, cyclops, beast]

23.times do
  owner = users.sample
  assigned = users.sample
  finished = [true, false].sample

  task = FactoryGirl.create :task, owner: owner, user: assigned, finished: finished

  7.times { task.comments.create user: [owner, assigned].sample }
end

