require 'rails_helper'

feature 'achievement page' do
    scenario 'achievement public page' do
        achievement = FactoryBot.create(:achievement, title: 'Completed it')
        visit("/achievements/#{achievement.id}")
        
        expect(page).to have_content('Completed it')
    end

    scenario 'render markdown description' do
        achievement = FactoryBot.create(:achievement, description: 'That *was* hard')
        visit("/achievements/#{achievement.id}")
        
        expect(page).to have_content('<em>was</em>')
    end
end