require_relative '../../config'

RSpec.describe 'Direction' do
  describe '#west?' do
    it { expect(Direction.new('W')).to respond_to(:west?) }
    it { expect(Direction.new('W').west?).to be(true) }
    it { expect(Direction.new('N').west?).to be(false) }
  end

  describe '#north?' do
    it { expect(Direction.new('W')).to respond_to(:north?) }
    it { expect(Direction.new('N').north?).to be(true) }
    it { expect(Direction.new('W').north?).to be(false) }
  end

  describe '#east?' do
    it { expect(Direction.new('W')).to respond_to(:east?) }
    it { expect(Direction.new('E').east?).to be(true) }
    it { expect(Direction.new('N').east?).to be(false) }
  end

  describe '#south?' do
    it { expect(Direction.new('W')).to respond_to(:south?) }
    it { expect(Direction.new('S').south?).to be(true) }
    it { expect(Direction.new('N').south?).to be(false) }
  end

  describe '#right' do
    subject { Direction.new('W') }
    it { expect(subject).to respond_to(:right) }

    it 'turns right' do
      subject.right
      expect(subject.north?).to be(true)
    end
  end

  describe '#left' do
    subject { Direction.new('W') }
    it { expect(subject).to respond_to(:left) }

    it 'turns left' do
      subject.left
      expect(subject.south?).to be(true)
    end
  end

  describe '#value' do
    subject { Direction.new('W') }

    it { expect(subject).to respond_to(:value) }

    it { expect(subject.value).to eq('W') }
  end
end
