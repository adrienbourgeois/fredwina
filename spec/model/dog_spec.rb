require_relative '../../config'

RSpec.describe 'dog' do

  describe 'move' do
    subject { Dog.new([1,2,'N']) }

    it { expect(subject).to respond_to(:move) }

    it 'moves the dog to the right coord' do
      subject.move
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(3)
      expect(subject.orientation).to eq('N')
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

    context 'with M' do
      it 'calls move' do
        expect(subject).to receive(:move)
        subject.execute('M')
      end
    end

    context 'otherwise' do
      it 'calls turn' do
        expect(subject).to receive(:turn).with('L')
        subject.execute('L')
      end
    end
  end
end