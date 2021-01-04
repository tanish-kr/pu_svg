# frozen_string_literal: true

RSpec.describe PuSvg::SearchModel do
  subject { -> { described_class.new(selector: selector, selector_type: selector_type, attribute: attribute) } }
  let(:selector) { "//" }

  context "when invalid params" do
    let(:selector_type) { "xpath" }
    let(:attribute) { "content" }

    it { is_expected.not_to raise_error }
  end

  context "when valid selector" do
    let(:selector_type) { "xp" }
    let(:attribute) { "content" }

    it { is_expected.to raise_error(ArgumentError) }
  end

  context "when valid attribute" do
    let(:selector_type) { "xpath" }
    let(:attribute) { "html" }

    it { is_expected.to raise_error(ArgumentError) }
  end
end
