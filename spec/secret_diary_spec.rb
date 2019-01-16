require 'secret_diary'

RSpec.describe SecretDiary do

  before(:each) do
    @locker = double('a locker')
    allow(@locker).to receive(:locked?).and_return(true)
    allow(@locker).to receive(:lock).and_return(true)
    allow(@locker).to receive(:unlock).and_return(false)
    @diary = SecretDiary.new(@locker)
  end
  
  it { is_expected.to respond_to(:add_entry) }
  it { is_expected.to respond_to(:get_entries) }
  
  it 'Checks that SecretDiary is locked at start' do
    expect(@diary.locked?).to eq(true)
  end

  it 'Checks that #lock locks the diary' do
    @diary.lock
    expect(@diary.locked?).to eq(true)
  end

  it 'Checks that #unlock unlocks the diary' do
    @diary.unlock
    allow(@locker).to receive(:locked?).and_return(false)
    expect(@diary.locked?).to eq(false)
  end

  it 'Should throw error if #add_entry is called when locked' do
    expect { @diary.add_entry }.to raise_error "error"
  end

  it 'Should throw error if #get_entries is called when locked' do
    expect { @diary.get_entries }.to raise_error "error"
  end
end