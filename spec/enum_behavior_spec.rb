require "spec_helper"

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include EnumBehavior
end

class Music < ApplicationRecord
  enum genre: { pop: 0, rock: 1 }
  enum_behavior :genre
  delegate :message, to: :genre_behavior
end

module Musics
  class Pop < EnumBehavior::Base
    def message
      "love music!"
    end
  end
end

RSpec.describe EnumBehavior do
  it "has a version number" do
    expect(EnumBehavior::VERSION).not_to be nil
  end

  describe "target class" do
    let(:model) { Music.new }

    describe '#{enum}_behavior' do # rubocop:disable Lint/InterpolationCheck
      subject { model.genre_behavior }

      it { is_expected.to be_nil }

      context "defined class exists" do
        before do
          model.genre = :pop
        end
        it { is_expected.to be_a(Musics::Pop) }
        it { is_expected.to have_attributes(model: model) }
        it "delegates works" do
          expect(model.message).to eq("love music!")
        end
      end

      context "defined class not exists" do
        before do
          model.genre = :rock
        end
        it { expect { subject }.to raise_error(NameError) }
      end
    end
  end
end
