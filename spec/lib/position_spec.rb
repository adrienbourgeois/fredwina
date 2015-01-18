require_relative '../../config'

RSpec.describe 'Position' do
  subject { Position.new(1,2) }

  describe '#x' do
    it { expect(subject.x).to eq(1) }
  end

  describe '#y' do
    it { expect(subject.y).to eq(2) }
  end

  describe '#x=' do
    it { expect(subject).to respond_to(:x=) }
  end

  describe '#y=' do
    it { expect(subject).to respond_to(:y=) }
  end

  describe '#equal?' do
    context 'when the position have the same coords' do
      let(:position2) { Position.new(1,2) }
      it { expect(subject.equal?(position2)).to be(true) }
    end

    context 'otherwise' do
      let(:position2) { Position.new(1,3) }
      it { expect(subject.equal?(position2)).to be(false) }
    end
  end

  describe '#move' do
    let(:direction) { Direction.new('N') }

    it { expect(subject).to respond_to(:move) }

    it 'changes the position according to the direction' do
      subject.move(direction)
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(3)
    end
  end
end