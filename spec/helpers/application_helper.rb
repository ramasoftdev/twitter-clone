require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  SUCCESS_MSG = "<div class='alert alert-success alert-dismissible fade show' role='alert'><strong>Success Message</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>"
  DANGER_MSG  = "<div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>Success Message</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>"
  WARNING_MSG = "<div class='alert alert-warning alert-dismissible fade show' role='alert'><strong>Success Message</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>"

  describe "#toastr_flash" do
    context "With a success message" do
      subject { flash[:success] = "Success Message" }
      it do
        subject
        expect(toastr_flash).to eql(SUCCESS_MSG)
      end
    end

    context "With a notice message" do
      subject { flash[:notice] = "Success Message" }
      it do
        subject
        expect(toastr_flash).to eql(SUCCESS_MSG)
      end
    end

    context "With a danger message" do
      subject { flash[:danger] = "Success Message" }
      it do
        subject
        expect(toastr_flash).to eql(DANGER_MSG)
      end
    end

    context "With a error message" do
      subject { flash[:error] = "Success Message" }
      it do
        subject
        expect(toastr_flash).to eql(DANGER_MSG)
      end
    end

    context "With a alert message" do
      subject { flash[:alert] = "Success Message" }
      it do
        subject
        expect(toastr_flash).to eql(DANGER_MSG)
      end
    end

    context "With a warning message" do
        subject { flash[:warning] = "Success Message" }
        it do
          subject
          expect(toastr_flash).to eql(WARNING_MSG)
        end
      end
  end
end
