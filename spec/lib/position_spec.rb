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
end