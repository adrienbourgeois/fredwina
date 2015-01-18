require_relative '../../config'

RSpec.describe 'Position' do
  subject { Position.new([1,2,'N']) }

  describe 'initialization' do
    context 'with coord that are not of integer type' do
      subject { Position.new([:a,:b,'N']) }
      it 'raises an error' do
        expect{ subject }.to raise_error("Coordinates not valid")
      end
    end

    context 'with an invalid cardinal point' do
      subject { Position.new([1,2,'A']) }
      it 'raises an error' do
        expect{ subject }.to raise_error("Invalid cardinal point")
      end
    end

    context 'without a cardinal point' do
      subject { Position.new([1,2]) }
      it 'does not raise an error' do
        expect{ subject }.to_not raise_error
      end
    end
  end

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
      let(:position2) { Position.new([1,2]) }
      it { expect(subject.equal?(position2)).to be(true) }
    end

    context 'otherwise' do
      let(:position2) { Position.new([1,3]) }
      it { expect(subject.equal?(position2)).to be(false) }
    end
  end

  describe '#>' do
    subject { Position.new([1,2]) }

    it { expect(subject).to respond_to(:>) }

    it 'returns true if one of the two coord is greater' do
      expect(subject > Position.new([1,1])).to be(true)
    end
  end

  describe '#move' do
    it { expect(subject).to respond_to(:move) }

    it 'changes the position according to the direction' do
      subject.move
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(3)
    end
  end
end