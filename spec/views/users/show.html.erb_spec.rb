require 'rails_helper'

# тесты на шаблон app/views/users/show.html.erb

RSpec.describe 'users/show', type: :view do
  let(:game) { FactoryBot.create(:game, id: 15, created_at: Time.parse('2016.10.09, 13:00'), current_level: 10, prize: 1000) }

  context 'render the users game' do
    before(:each) do
      assign(:user, FactoryBot.build_stubbed(:user, name: 'Вадик', balance: 5000))

      render
    end

    it 'render the player name' do
      expect(rendered).to match 'Вадик'
    end

    it 'the settings of the logged in player are not render' do
      expect(rendered).not_to match 'Сменить имя и пароль'
    end
  end

  context 'render the users game for a logged user' do
    before(:each) do
      user = FactoryBot.create(:user, name: 'Вадик', balance: 5000)

      sign_in user
      assign(:user, user)
      assign(:game, game)

      render
    end

    it 'render the player name' do
      expect(rendered).to match 'Вадик'
    end

    it 'the settings of the logged in player are render' do
      expect(rendered).to match 'Сменить имя и пароль'
    end
  end

  context 'shows game elements' do
    before(:each) do
      user = FactoryBot.create(:user, name: 'Вадик', balance: 5000)

      sign_in user
      assign(:user, user)
      assign(:game, game)

      render partial: 'users/game', object: game
    end

    it 'renders game fragments' do
      expect(rendered).to match 'в процессе'
      expect(rendered).to match '09 окт., 13:00'
      expect(rendered).to match '1 000 ₽'
      expect(rendered).to match '15'
      expect(rendered).to match '50/50'
    end
  end
end