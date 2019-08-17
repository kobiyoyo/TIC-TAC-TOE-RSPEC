require './lib/my_array'
describe Array do 
    context "#all_empty?" do
        it "checks to see if all elements are empty" do
            expect(["","",""].all_empty?).to be true
        end
        it "checks to see if all elements are empty,return true if it is" do
            expect([].all_empty?).to be true
        end
        it "checks to see if all elements are empty,return false if its not" do
            expect(["hello","","2"].all_empty?).to be false
        end

    end
    context "#all_same?" do
        it "checks to see if all elements are the same" do
            expect(["D","D","D"].all_same?).to be true
        end
        it "checks to see if all elements are the same,return true if it is" do
            expect([].all_same?).to be true
        end
        it "checks to see if all elements are not the same,return false if its not" do
            expect(["hello","","2"].all_same?).to be false
        end

    end
    context "#any_empty?" do
        it "checks to see if any elements is empty,return if none is empty" do
            expect(["D","D","d"].any_empty?).to be false
        end
        
        it "checks to see if any elements is empty,return true if it is" do
            expect(["hello","","2"].any_empty?).to be true
        end
    end
    context "#none_empty?" do
        it "checks to see if any elements is empty,return if none is empty" do
            expect(["D","D","d"].none_empty?).to be true
        end
        
        it "checks to see if any elements is empty,return true if it is" do
            expect(["hello","","2"].none_empty?).to be false
        end
    end
end