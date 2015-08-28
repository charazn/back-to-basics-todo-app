require 'rails_helper'

RSpec.describe ListsController, type: :routing do

  it { expect(get: '/lists').to route_to(controller: 'lists', action: 'index') }
  it { expect(get: '/lists/1').to route_to(controller: 'lists', action: 'show', id: '1') }
  it { expect(get: '/lists/new').to route_to(controller: 'lists', action: 'new') }
  it { expect(post: '/lists').to route_to(controller: 'lists', action: 'create') }
  it { expect(get: '/lists/1/edit').to route_to(controller: 'lists', action: 'edit', id: '1') }
  it { expect(patch: '/lists/1').to route_to(controller: 'lists', action: 'update', id: '1') }
  it { expect(put: '/lists/1/delete').to route_to(controller: 'lists', action: 'archive', id: '1') }

end
