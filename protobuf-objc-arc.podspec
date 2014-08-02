Pod::Spec.new do |s|
  s.name     = 'Protobuf-objc-arc'
  s.header_dir = "ProtocolBuffers"
  s.version  = '0.0.5'
  s.license  = 'Apache 2.0'
  s.summary  = 'An implementation of Protocol Buffers in Objective C.'
  s.homepage = 'https://github.com/eugeneego/protobuf-objc-arc'
  s.authors   = { 'Evgeniy Egorov' => 'eugene.ego@gmail.com', 'Justin Middleton' => 'justin@whistle.com', 'Ragy Eleish' => 'ragy@regwez.com', 'Cyrus' => 'cyrusn@stwing.upenn.edu', 'Robert Carlsen' => 'robert@robertcarlsen.net' }
  s.source   = { :git => 'https://github.com/eugeneego/protobuf-objc-arc.git' }
  #s.source   = { :git => 'https://github.com/eugeneego/protobuf-objc-arc.git', :tag => '#{s.version}' }
  s.xcconfig = { 'WARNING_CFLAGS' => '-Wno-missing-prototypes -Wno-format' }
  s.requires_arc = true

  s.subspec 'Runtime' do |ss|
    ss.source_files = 'src/runtime/Classes/*.{h,m}'
  end

  # this subspec should not be used...it is just a way to separate
  # the runtime files and ease pod integration with other projects
  #s.subspec 'Compiler' do |ss|
  #  ss.preserve_paths = [
  #    "src/compiler/protoc-gen-objc"
  #  ]
  #
  #  ss.prepare_command = './autogen.sh && ./configure && make'
  #end

end
