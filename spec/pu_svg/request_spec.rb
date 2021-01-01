# frozen_string_literal: true

class DummyClass

  include PuSvg::Request

end

RSpec.describe PuSvg::Request do
  let(:dummy_class) { DummyClass.new }

  describe "#get" do
    subject { -> { dummy_class.get(uri: uri) } }
    context "when exists redirect" do
      let(:uri) { "http://www.plantuml.com/plantuml/uml" }

      it { is_expected.not_to raise_error }
    end

    context "when 403 error" do
      let(:uri) { "http://www.tanish-kr.com/example" }

      it { is_expected.to raise_error(PuSvg::Request::RequestError) }
    end
  end
end
