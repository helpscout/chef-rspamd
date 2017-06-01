#
# Cookbook Name:: rspamd
# Recipe:: config
#
# Author:: Jared R. Baldridge <jrb@helpscout.com>
# Copyright 2017, Help Scout
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['rspamd']['filters'].is_a?(Array)
  filters = node['rspamd']['filters'].join(',')
elsif node['rspamd']['filters'].is_a?(String)
  filters = node['filters']
else
  Chef::Log.Fatal("node['rspamd']['filters'] must be a String or an Array of Strings.")
end

# Top Level Options
template '/etc/rspamd/local.d/options.inc' do
  source    'options.inc.erb'
  user      'root'
  group     'root'
  mode      '0644'
  notifies  :reload, 'service[rspamd]', :delayed
  variables(
    :filters => filters
  )
end

# Greylist Module
template '/etc/rspamd/local.d/greylist.conf' do
  source    'greylist.conf.erb'
  user      'root'
  group     'root'
  mode      '0644'
  notifies  :reload, 'service[rspamd]', :delayed
end

# Statistics Module Bayes Classifier
template '/etc/rspamd/local.d/classifier-bayes.conf' do
  source    'classifier-bayes.conf.erb'
  user      'root'
  group     'root'
  mode      '0644'
  notifies  :reload, 'service[rspamd]', :delayed
end

# Worker Configs
template '/etc/rspamd/local.d/worker-controller.inc' do
  source    'worker-controller.inc.erb'
  user      'root'
  group     'root'
  mode      '0644'
  notifies  :reload, 'service[rspamd]', :delayed
end

template '/etc/rspamd/local.d/worker-normal.inc' do
  source    'worker-normal.inc.erb'
  user      'root'
  group     'root'
  mode      '0644'
  notifies  :reload, 'service[rspamd]', :delayed
end

unless node['rspamd']['redis']['servers'].nil?

  template '/etc/rspamd/local.d/redis.conf' do
    source    'redis.conf.erb'
    user      'root'
    group     'root'
    mode      '0644'
    notifies  :reload, 'service[rspamd]', :delayed
  end

end

# vim: ai ts=2 sts=2 et sw=2 ft=ruby
