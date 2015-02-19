require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe DistributesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Distribute. As you add validations to Distribute, be sure to
  # adjust the attributes here as well.
  let(:distributor) { Factory :distributor }
  let(:apply) { Factory :apply }
  let(:valid_attributes) {
    {is_distribute: true, user_id: distributor.id, apply_id: apply.id}
  }

  let(:invalid_attributes) {
    {is_distribute: '', user_id: distributor.id, apply_id: apply.id}
  }
  before(:each){ sign_in distributor }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Distribute" do
        expect {
          post :create, {:distribute => valid_attributes}
        }.to change(Distribute, :count).by(1)
      end

      it "assigns a newly created distribute as @distribute" do
        post :create, {:distribute => valid_attributes}
        expect(assigns(:distribute)).to be_a(Distribute)
        expect(assigns(:distribute)).to be_persisted
      end

      it "redirects to the created distribute" do
        post :create, {:distribute => valid_attributes}
        expect(response).to redirect_to(apply_path(Distribute.last.apply))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved distribute as @distribute" do
        post :create, {:distribute => invalid_attributes}
        expect(assigns(:distribute)).to be_a_new(Distribute)
      end

      it "re-renders the 'new' template" do
        post :create, {:distribute => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

end
