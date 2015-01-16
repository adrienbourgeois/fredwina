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
end