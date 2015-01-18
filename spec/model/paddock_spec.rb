require_relative '../../config'

RSpec.describe 'paddock' do
  describe 'initialization' do
    subject { Paddock }

    context 'when a dog initial position is outside of the paddock' do
      let(:dog) { Dog.new([6,6,'N']) }
      it 'raises an error' do
        expect{ subject.new([5,5],[dog]) }.to raise_error("Dogs initial position have to be inside the paddock")
      end
    end

    context 'when at least two dogs have the same initial position' do
      let(:dog1) { Dog.new([3,3,'N']) }
      let(:dog2) { Dog.new([3,3,'N']) }
      it 'raises an error' do
        expect{ subject.new([5,5],[dog1,dog2]) }.to raise_error("Dogs cannot have the same initial position")
      end
    end
  end

  describe '#give_order_to' do
    let(:dog) { Dog.new([1,1,'N']) }
    subject { Paddock.new([5,5],[dog]) }

    it { expect(subject).to respond_to(:give_order_to) }

    context 'when the dogs does not exist' do
      it 'raises an exception' do
      end
    end

    context 'when the dog exist' do
      it 'calls execute on the dog' do
        expect(dog).to receive(:execute).with(subject,'M')
        subject.give_order_to(0,'M')
      end
    end
  end

  describe '#execute_orders' do
    let(:dog1) { Dog.new([1,1,'N']) }
    let(:dog2) { Dog.new([4,4,'W']) }
    let(:orders) do
      [
        ['M','M']
      ]
    end
    subject { Paddock.new([5,5],[dog1,dog2]) }

    it { expect(subject).to respond_to(:execute_orders) }

    it 'gives the orders to the dogs' do
      expect(subject).to receive(:give_order_to).with(0,'M')
      expect(subject).to receive(:give_order_to).with(1,'M')
      subject.execute_orders(orders)
    end
  end

  describe '#helicopter_view' do
    let(:dog1) { Dog.new([1,1,'N']) }
    let(:dog2) { Dog.new([4,4,'W']) }
    subject { Paddock.new([5,5],[dog1,dog2]) }

    it { expect(subject).to respond_to(:helicopter_view) }

    it 'returns the helicopter_view' do
      expect(subject.helicopter_view).to eq("1 1 N\n4 4 W\n")
    end
  end

  describe '#free?' do
    let(:dog1) { Dog.new([1,1,'N']) }
    let(:dog2) { Dog.new([4,4,'W']) }
    subject { Paddock.new([5,5],[dog1,dog2]) }

    it { expect(subject).to respond_to(:free?) }

    context 'there is no dog at that position' do
      it { expect(subject.free?(Position.new(2,2))).to eq(true) }
    end

    context 'there is a dog at that position' do
      it { expect(subject.free?(Position.new(1,1))).to eq(false) }
    end
  end

  describe '#out_of_bound?' do
    subject { Paddock.new([5,5],[]) }

    it { expect(subject).to respond_to(:out_of_bound?) }

    context 'when coord is inside the paddock' do
      it { expect(subject.out_of_bound?(Position.new(2,2))).to eq(false) }
    end

    context 'when coord is outside the paddock' do
      it { expect(subject.out_of_bound?(Position.new(6,2))).to eq(true) }
    end
  end
end