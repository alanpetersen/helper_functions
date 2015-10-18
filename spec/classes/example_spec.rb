require 'spec_helper'

describe 'helper_functions' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "helper_functions class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('helper_functions::params') }
          it { is_expected.to contain_class('helper_functions::install').that_comes_before('helper_functions::config') }
          it { is_expected.to contain_class('helper_functions::config') }
          it { is_expected.to contain_class('helper_functions::service').that_subscribes_to('helper_functions::config') }

          it { is_expected.to contain_service('helper_functions') }
          it { is_expected.to contain_package('helper_functions').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'helper_functions class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('helper_functions') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
