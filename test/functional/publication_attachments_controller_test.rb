require 'test_helper'

class PublicationAttachmentsControllerTest < ActionController::TestCase
  setup do
    @publication_attachment = publication_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publication_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publication_attachment" do
    assert_difference('PublicationAttachment.count') do
      post :create, publication_attachment: @publication_attachment.attributes
    end

    assert_redirected_to publication_attachment_path(assigns(:publication_attachment))
  end

  test "should show publication_attachment" do
    get :show, id: @publication_attachment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publication_attachment.to_param
    assert_response :success
  end

  test "should update publication_attachment" do
    put :update, id: @publication_attachment.to_param, publication_attachment: @publication_attachment.attributes
    assert_redirected_to publication_attachment_path(assigns(:publication_attachment))
  end

  test "should destroy publication_attachment" do
    assert_difference('PublicationAttachment.count', -1) do
      delete :destroy, id: @publication_attachment.to_param
    end

    assert_redirected_to publication_attachments_path
  end
end
