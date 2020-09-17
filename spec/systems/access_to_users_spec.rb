require 'pry'


RSpec.describe 'access_to_user', type: :system do

  describe 'POST #create for user' do
      #有効なユーザーの検証
      context 'valid request' do
        #ユーザーが追加される
        it 'adds a user' do
          expect do
            post "/signup", params: { user: attributes_for(:user) }
          end.to change(User, :count).by(1)
        end

        context 'adds a user' do
          before { post signup_path, params: { user: attributes_for(:user) } }
          subject { response }
          it { is_expected.to redirect_to user_path(User.last) } #showページにリダイレクトされる
          it { is_expected.to have_http_status 302 } #リダイレクト成功
        end
      end
      #無効なリクエストの送信テスト
      context 'invalid request' do
        #無効なデータを作成
        let(:user_params) do
          attributes_for(:user, name: '',
                                email: 'user@invalid',
                                password: '',
                                password_confirmation: '')
        end
        #ユーザーが追加されないときのテスト
        it 'does not add a user' do
          expect do
            post signup_path, params: { user: user_params }
          end.to change(User, :count).by(0)
        end
      end
  end


    describe 'POST #create' do
      context 'valid request' do
        it 'adds a user' do
          expect do
            post signup_path, params: { user: attributes_for(:user) }
          end.to change(User, :count).by(1)
        end

        context 'adds a user but do not through email' do
          before { post signup_path, params: { user: attributes_for(:user) } }
          subject { response }

          it { is_expected.to redirect_to user_path(User.last) }
          it { is_expected.to have_http_status 302 } #リダイレクト成功
          it 'log in' do
            expect(is_logged_in?).to be_falsey
          end
        end
    end
  end
end
