require_relative '../../config'

RSpec.describe 'parser' do
  subject { Parser.new(File.open("#{ROOT}/spec/fixtures/input_example_4dogs.txt")) }
  context 'with a valid file' do
    describe 'creation' do
      it "creates dogs with the right params" do
        expect(Dog).to receive(:new).with([1,2,'N'])
        expect(Dog).to receive(:new).with([3,3,'E'])
        expect(Dog).to receive(:new).with([5,5,'E'])
        expect(Dog).to receive(:new).with([4,4,'E'])
        subject
      end
    end

    describe '#paddock_coord' do
      it { expect(subject).to respond_to(:paddock_coord) }
      it { expect(subject.paddock_coord).to eq([5,5]) }
    end

    describe '#dogs' do
      it { expect(subject).to respond_to(:dogs) }
      it { expect(subject.dogs).to be_an(Array) }
      it { expect(subject.dogs.first).to be_a(Dog) }
    end

    describe '#orders' do
      it { expect(subject).to respond_to(:orders) }

      it 'set orders correctly' do
        expect(subject.orders).to eq([
            ['L','M','L','L'],
            ['M','M',nil,'L'],
            ['L','R',nil,'L'],
            ['M','M',nil,'L'],
            ['L','M',nil,'L'],
            ['M','R',nil,'L'],
            ['L','M',nil,'L'],
            ['M','R',nil,'L'],
            ['M','R',nil,'L'],
            [nil,'M',nil,'L'],
            [nil,nil,nil,'L'],
          ])
      end
    end
  end
end