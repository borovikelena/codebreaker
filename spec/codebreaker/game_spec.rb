#---
# Excerpted from "The RSpec Book",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/achbd for more book information.
#---
require 'spec_helper'
module Codebreaker
  describe Game do
    describe "#start" do
      let(:output) {double('output').as_null_object}
      let(:game) {Game.new(output)}

      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end
      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.start('1234')
      end
    end
    describe "#guess" do
      context "with no  matches" do
        it "sends a mark with ''" do
          game.start('1234')
          output.should_receive(:puts).with('')
          game.guess('5555')
        ens
      end
      context "with 1 number matches" do
        it "sends a mark with '-'" do
          game.start('1234')
          output.should_receive(:puts).with('-')
          game.guess('2555')
        end
      end

      context "with 1 exact matches" do
        it "sends a mark with '+'" do
          game.start('1234')
          output.should_receive(:puts).with('+')
          game.guess('1555')
        end
      end

      context "with 2 exact matches" do
        it "sends a mark with '++'" do
          game.start('1234')
          output.should_receive(:puts).with('++')
          game.guess('5254')
        end
      end
      
      context "with 1 exact and 1 include matches" do
        it "sends a mark with '+-'" do
          game.start('1234')
          output.should_receive(:puts).with('+-')
          game.guess('5154')
        end
      end


    end
  end
end
