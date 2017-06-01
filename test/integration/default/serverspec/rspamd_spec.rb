require 'spec_helper'

describe 'rspamd' do
  it 'has a running service named rspamd' do
    expect(service('rspamd')).to be_running
  end

  it 'has a controller worker listening on 127.0.0.1:11334 and ::1:11334' do
    expect(port(11334)).to be_listening.on('127.0.0.1')
    expect(port(11334)).to be_listening.on('::1')
  end

  it 'has a normal worker listening on 0.0.0.0:11333 and :::11333' do
    expect(port(11333)).to be_listening.on('0.0.0.0')
    expect(port(11333)).to be_listening.on('::')
  end
    
end
