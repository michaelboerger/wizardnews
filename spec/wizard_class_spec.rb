require_relative '../lib/wizard_class'
require 'rspec'

describe WizardClass  do
  it "has a title" do
    harry_potter = WizardClass.new('title', 'url', 'discription')
    expect(harry_potter.title).to eq 'title'
  end

  it "has a url" do
    harry_potter = WizardClass.new('title', 'url', 'discription')
    expect(harry_potter.url).to eq 'url'
  end

  it "has a discription" do
    harry_potter = WizardClass.new('title', 'url', 'discription')
    expect(harry_potter.discription).to eq 'discription'
  end

  it 'makes sure you there is valid title' do
    invalid_title = WizardClass.new('2222', 'url', 'discription')
    expect(invalid_title.validate_title).to eq("Invalid title")
  end

  it 'makes sure there is valid url' do
    invalid_url = WizardClass.new('title', 'url11111', 'discription')
    expect(invalid_url.validate_url).to eq('Invalid url')
  end

  it 'makes sure there is valid discription' do
    invalid_discription = WizardClass.new('title', 'url', 'discription11')
    expect(invalid_discription.validate_discription).to eq('Invalid discription')
  end
end

