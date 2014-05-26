require 'spec_helper'

describe Kosmos::DownloadUrl do
  it 'detects mediafire links' do
    url = 'http://www.mediafire.com/download/some-random-stuff/whatever.zip'
    expect(Kosmos::DownloadUrl.new(url)).to be_mediafire
  end

  it 'correctly resolves mediafire download urls' do
    url = 'file://' + File.absolute_path('spec/fixtures/example_mediafire.html')
    target_url = 'http://download1690.mediafire.com/qny71y9k6kvg/o6cbe03iitggj1p/B9+Aerospace+Pack+R4.0c.zip'

    expect(Kosmos::DownloadUrl.new(url).resolve_download_url).to eq target_url
  end

  it 'detects box links' do
    url = 'https://app.box.com/s/some-random-stuff'
    expect(Kosmos::DownloadUrl.new(url)).to be_box
  end

  it 'detects dropbox links' do
    url = 'https://www.dropbox.com/s/some-random-stuff/whatever.zip'
    expect(Kosmos::DownloadUrl.new(url)).to be_dropbox
  end

  it 'correctly resolves dropbox download urls' do
    url = 'file://' + File.absolute_path('spec/fixtures/example_dropbox.html')
    target_url = 'https://dl.dropboxusercontent.com/s/od4kickxt92jpo2/BetterAtmosphereV4%5BREL%5D.zip?dl=1&token_hash=AAFn5emxuVXLw_RfjDgQs0Hn7-YZ-vejn3m8zLgOj2tTFA&expiry=1401095304'

    expect(Kosmos::DownloadUrl.new(url).resolve_download_url).to eq target_url
  end
end