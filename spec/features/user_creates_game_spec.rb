require 'rails_helper'

RSpec.feature 'USER creates a game', type: :feature do
  # Готовим базу: создаём пользователя
  let(:user) { FactoryBot.create :user }

  # А также 15 вопросов с разными уровнями сложности
  # Обратите внимание, текст вопроса и вариантов ответа
  # здесь важен — их мы потом будем проверять
  let!(:questions) do
    (0..14).to_a.map do |i|
      FactoryBot.create(
        :question, level: i,
        text: "Когда была куликовская битва номер #{i}?",
        answer1: '1380', answer2: '1381', answer3: '1382', answer4: '1383'
      )
    end
  end

  # Авторизуем пользователя перед началом любого сценария
  before(:each) do
    login_as user
  end

  # Сценарий успешного создания игры
  scenario 'successfully' do
    # Заходим на главную
    visit '/'
  end
end
