require_relative 'shared/klass'

describe Boundary do
  include_context :boundary_klass
  let(:instance) { klass.new }

  describe '#size' do
    subject { instance.size }

    it { should be_instance_of Vector }
    its(:components) { should eq [0, 0, 0] }
  end

  describe '#size=' do
    subject { instance.method(:size=) }

    it_behaves_like 'writer', random_vector
  end
end