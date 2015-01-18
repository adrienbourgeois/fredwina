require_relative '../../config'

RSpec.describe 'Shepherd' do
  describe '#give_order_to' do
    let(:dog) { Dog.new([1,1,'N']) }
    let(:paddock) { Paddock.new([5,5],[dog]) }
    subject { Shepherd.new(paddock) }

    it { expect(subject).to respond_to(:give_order_to) }

    context 'when the dogs does not exist' do
      it 'raises an exception' do
        expect{ subject.give_order_to(1,'M') }.to raise_error "Dog with id 1 does not exist"
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
    let(:paddock) { Paddock.new([5,5],[dog1,dog2]) }
    subject { Shepherd.new(paddock) }

    it { expect(subject).to respond_to(:execute_orders) }

    it 'gives the orders to the dogs' do
      expect(subject).to receive(:give_order_to).with(0,'M')
      expect(subject).to receive(:give_order_to).with(1,'M')
      subject.execute_orders(orders)
    end
  end
end
