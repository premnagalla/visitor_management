require 'test_helper'

class TenantLockersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tenant_locker = tenant_lockers(:one)
  end

  test "should get index" do
    get tenant_lockers_url
    assert_response :success
  end

  test "should get new" do
    get new_tenant_locker_url
    assert_response :success
  end

  test "should create tenant_locker" do
    assert_difference('TenantLocker.count') do
      post tenant_lockers_url, params: { tenant_locker: { end_date: @tenant_locker.end_date, locker_id: @tenant_locker.locker_id, start_date: @tenant_locker.start_date, user_id: @tenant_locker.user_id } }
    end

    assert_redirected_to tenant_locker_url(TenantLocker.last)
  end

  test "should show tenant_locker" do
    get tenant_locker_url(@tenant_locker)
    assert_response :success
  end

  test "should get edit" do
    get edit_tenant_locker_url(@tenant_locker)
    assert_response :success
  end

  test "should update tenant_locker" do
    patch tenant_locker_url(@tenant_locker), params: { tenant_locker: { end_date: @tenant_locker.end_date, locker_id: @tenant_locker.locker_id, start_date: @tenant_locker.start_date, user_id: @tenant_locker.user_id } }
    assert_redirected_to tenant_locker_url(@tenant_locker)
  end

  test "should destroy tenant_locker" do
    assert_difference('TenantLocker.count', -1) do
      delete tenant_locker_url(@tenant_locker)
    end

    assert_redirected_to tenant_lockers_url
  end
end
