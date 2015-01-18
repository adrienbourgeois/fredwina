require_relative '../../config'

RSpec.describe 'dog' do

  describe 'move' do
    subject { Dog.new([1,2,'N']) }

    it { expect(subject).to respond_to(:move) }

    it 'returns the coord the dog would have if it executes the motion' do
      expect(subject.move).to eq([1,3])
    end
  end

  describe 'move!' do
    subject { Dog.new([1,1,'N']) }
    let(:paddock) { Paddock.new([5,5],[subject]) }

    it { expect(subject).to respond_to(:move!) }

    it 'moves the dog to his new position' do
      subject.move!(paddock)
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
    end

    context 'when the dog try to go outside the paddock' do
      subject { Dog.new([5,5,'N']) }
      let(:paddock) { Paddock.new([5,5],[subject]) }

      it 'raises an error' do
        expect{ subject.move!(paddock) }.to raise_error("Dogs have to stay inside of the paddock")
      end
    end

    context 'when a dog try to bump into another dog' do
      subject { Dog.new([5,4,'N']) }
      let(:dog2) { Dog.new([5,5,'N']) }
      let(:paddock) { Paddock.new([5,5],[subject,dog2]) }

      it 'raises an error' do
        expect{ subject.move!(paddock) }.to raise_error("Dogs cannot bump into each other")
      end
    end
  end

  describe 'turn' do
    subject { Dog.new([1,2,'N']) }
    it { expect(subject).to respond_to(:turn) }

    context 'turn to the left' do
      subject { Dog.new([1,2,'N']) }
      it "changes the dog's orientation" do
        subject.turn('L')
        expect(subject.orientation).to eq('W')
      end
    end

    context 'turn to the left' do
      subject { Dog.new([1,2,'N']) }
      it "changes the dog's orientation" do
        subject.turn('R')
        expect(subject.orientation).to eq('E')
      end
    end
  end

  describe 'execute' do
    subject { Dog.new([1,2,'N']) }
    let(:paddock) { Paddock.new([5,5],[subject]) }

    context 'with M' do
      it 'calls move' do
        expect(subject).to receive(:move!)
        subject.execute(paddock,'M')
      end
    end

    context 'otherwise' do
      it 'calls turn' do
        expect(subject).to receive(:turn).with('L')
        subject.execute(paddock,'L')
      end
    end
  end
end