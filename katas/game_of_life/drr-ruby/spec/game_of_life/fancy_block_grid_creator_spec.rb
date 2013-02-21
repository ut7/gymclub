# encoding: utf-8

require "spec_helper"

describe GameOfLife::FancyBlockGridCreator do

  it "breeds" do

    expect(subject.create do
        —————————————
        ¦ · · · · · ¦
        ¦ · · X · · ¦
        ¦ · · X · · ¦
        ¦ · · X · · ¦
        ¦ · · · · · ¦
        —————————————
      end.child
   ).to eq(described_class.new.create do
        —————————————
        ¦ · · · · · ¦
        ¦ · · · · · ¦
        ¦ · X X X · ¦
        ¦ · · · · · ¦
        ¦ · · · · · ¦
        —————————————
      end)

  end

end
