require_relative '../../config'

RSpec.describe 'paddock' do
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
        expect(dog).to receive(:execute).with('M')
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
      it { expect(subject.free?([2,2])).to eq(true) }
    end

    context 'there is a dog at that position' do
      it { expect(subject.free?([1,1])).to eq(false) }
    end
  end
end