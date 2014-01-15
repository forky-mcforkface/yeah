describe Entity, '#center' do
  it { subject.center.should eq V[] }

  context "with stage" do
    before do
      subject.stage = Stage.new
      subject.position = V[10, 10, 10]
      subject.size = V[4, 2, 8]
    end

    it "is position of center within stage based on anchor" do
      subject.anchor = V[0, 0, 0]
      subject.center.should eq V[10, 10, 10]

      subject.anchor = V[1, 1, 1]
      subject.center.should eq V[14, 12, 18]

      subject.anchor = V[0.5, 0.5, 0.5]
      subject.center.should eq V[12, 11, 14]
    end
  end
end
