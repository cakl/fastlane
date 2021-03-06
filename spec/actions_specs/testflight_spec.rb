describe Fastlane do
  describe Fastlane::FastFile do
    describe "TestFlight Action" do
      it "merges the passed parameter with the default values" do
        result = Fastlane::FastFile.new.parse("lane :test do 
          testflight
        end").runner.execute(:test)
        
        expect(result[:beta]).to eq(true)
        expect(result.values).to eq({:skip_deploy=>false, :beta=>true, :force=>false, :metadata_only=>false, :deliver_file_path=>"./fastlane/"})
      end

      it "uses the passed skip_deploy value if given" do
        result = Fastlane::FastFile.new.parse("lane :test do 
          testflight(skip_deploy: true)
        end").runner.execute(:test)
        
        expect(result.values).to eq({:skip_deploy=>true, :beta=>true, :force=>false, :metadata_only=>false, :deliver_file_path=>"./fastlane/"})
      end
    end
  end
end
