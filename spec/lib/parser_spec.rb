require_relative '../../config'

RSpec.describe 'parser' do
  subject { Parser.new(File.open("#{ROOT}/spec/fixtures/input_example_success.txt")) }
  context 'with a valid file' do
    describe 'creation' do
      it "creates dogs with the right params" do
        expect(Dog.any_instance).to receive(:new).with([1,2,'N'])
        expect(Dog.any_instance).to receive(:new).with([3,3,'E'])
        subject
      end
    end

    describe '#paddock_coord' do
      it { expect(subject.paddock_coord).to eq([5,5]) }
    end

    describe '#dogs' do
      it { expect(subject.dogs).to be_an(Array) }
      it { expect(subject.dogs.first).to be_a(Dog) }
    end
  end
end