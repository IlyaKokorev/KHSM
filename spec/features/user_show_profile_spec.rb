require 'rails_helper'

RSpec.feature 'USER show someone else profile', type: :feature do
  let(:user1) { FactoryBot.create :user }
  let(:user2) { FactoryBot.create :user }
  let(:game1) { FactoryBot.create :game, prize: 1000, user: user1 }
  let(:game2) { FactoryBot.create :game, prize: 10000, user: user2 }

  let!(:games) { [game2, game1] }

  before(:each) do
    login_as user1
  end

  scenario 'successfully' do
    visit '/'

    expect(page).to have_text(user1.name)

    click_link user2.name

    expect(page).to have_text user1.name
    expect(page).not_to have_text('Сменить имя и пароль')

    expect(page).to have_content('10 000 ₽')
    expect(page).to have_content('в процессе')
  end
end