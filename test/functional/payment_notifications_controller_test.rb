require 'test_helper'

class PaymentNotificationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PaymentNotification.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PaymentNotification.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PaymentNotification.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to payment_notification_url(assigns(:payment_notification))
  end

  def test_edit
    get :edit, :id => PaymentNotification.first
    assert_template 'edit'
  end

  def test_update_invalid
    PaymentNotification.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PaymentNotification.first
    assert_template 'edit'
  end

  def test_update_valid
    PaymentNotification.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PaymentNotification.first
    assert_redirected_to payment_notification_url(assigns(:payment_notification))
  end

  def test_destroy
    payment_notification = PaymentNotification.first
    delete :destroy, :id => payment_notification
    assert_redirected_to payment_notifications_url
    assert !PaymentNotification.exists?(payment_notification.id)
  end
end
