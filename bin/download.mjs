const animals = [
      'alligator', 'anteater', 'armadillo', 'auroch', 'badger', 'bat', 'beaver', 'buffalo', 'camel', 'capybara',
      'chameleon', 'cheetah', 'chinchilla', 'chipmunk', 'chupacabra', 'cormorant', 'coyote', 'crow', 'dingo', 'dolphin',
      'duck', 'elephant', 'ferret', 'fox', 'giraffe', 'gopher', 'grizzly', 'hippo', 'hyena', 'ibex',
      'iguana', 'jackal', 'kangaroo', 'koala', 'kraken', 'lemur', 'leopard', 'liger', 'llama', 'manatee',
      'mink', 'monkey', 'moose', 'narwhal', 'orangutan', 'otter', 'panda', 'penguin', 'platypus', 'python',
      'quagga', 'rabbit', 'raccoon', 'rhino', 'sheep', 'shrew', 'skunk', 'squirrel', 'tiger', 'turtle',
      'walrus', 'wolf', 'wolverine', 'wombat'
    ];


for (const icon of animals) {
	console.log(`curl https://ssl.gstatic.com/docs/common/profile/${icon}_lg.png >${icon}.png`);
}

