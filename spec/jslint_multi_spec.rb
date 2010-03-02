require 'spec_helper'

describe JSLintMulti do
  before do
    @good = File.join(JSLintMulti.root, 'spec', 'support', 'good.js')
    @bad = File.join(JSLintMulti.root, 'spec', 'support', 'bad.js')
  end
  context "passing jslint" do
    before do
      @response = `#{JSLintMulti.command([@good])}`
    end

    it "shows a dot" do
      @response.should =~ /\./
    end

    it "does not show an F" do
      @response.should_not =~ /F/
    end
  end

  context "failing jslint" do
    before do
      @response = `#{JSLintMulti.command([@bad])}`
    end

    it "shows an F" do
      @response.should =~ /F/
    end

    it "shows failures" do
      @response.should =~ /Failures:/
    end
  end
end
