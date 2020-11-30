##train.py##

from keras.preprocessing.image import ImageDataGenerator
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D
from keras.layers import Activation, Dropout, Flatten, Dense
from keras import backend as K

from google.colab import drive
drive.mount("/content/drive")

# dimensions of our images.
img_width, img_height = 150, 150

train_data_dir = '/content/drive/My Drive/Colab Notebooks/cats-vs-dogs/data/train'
validation_data_dir = '/content/drive/My Drive/Colab Notebooks/cats-vs-dogs/data/validation'
nb_train_samples = 2371
nb_validation_samples = 1171
epochs = 50
batch_size = 16

if K.image_data_format() == 'channels_first':
    input_shape = (3, img_width, img_height)
else:
    input_shape = (img_width, img_height, 3)

model = Sequential()
model.add(Conv2D(32, (3, 3), input_shape=input_shape))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(32, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(64, (3, 3)))
model.add(Activation('relu')) #sigmoid to relu
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Flatten())
model.add(Dense(64))
model.add(Activation('relu'))
model.add(Dropout(0.5))
model.add(Dense(3)) # Dense(1) to Dense(3)
model.add(Activation('relu'))

model.compile(loss='categorical_crossentropy', #binary_crossentropy to categorical_crossentropy
              optimizer='rmsprop',
              metrics=['accuracy'])

# this is the augmentation configuration we will use for training
train_datagen = ImageDataGenerator(
    rescale=1. / 255,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True)

# this is the augmentation configuration we will use for testing:
# only rescaling
test_datagen = ImageDataGenerator(rescale=1. / 255)

train_generator = train_datagen.flow_from_directory(
    train_data_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='categorical') #binary to categorical

validation_generator = test_datagen.flow_from_directory(
    validation_data_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='categorical') #binary to categorical

model.fit_generator(
    train_generator,
    steps_per_epoch=nb_train_samples // batch_size,
    epochs=epochs,
    validation_data=validation_generator,
    validation_steps=nb_validation_samples // batch_size)

model.save_weights('/content/drive/My Drive/Colab Notebooks/cats-vs-dogs/weights.h5')



##classify.py##

from keras.preprocessing.image import ImageDataGenerator
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D
from keras.layers import Activation, Dropout, Flatten, Dense
from keras import backend as K

import numpy

# dimensions of our images.
img_width, img_height = 150, 150


if K.image_data_format() == 'channels_first':
    input_shape = (3, img_width, img_height)
else:
    input_shape = (img_width, img_height, 3)
    
    


model = Sequential()
model.add(Conv2D(32, (3, 3), input_shape=input_shape))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(32, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(64, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Flatten())
model.add(Dense(64))
model.add(Activation('relu'))
model.add(Dropout(0.5))
model.add(Dense(3)) #Dense(1) to Dense(3)
model.add(Activation('relu')) #sigmoid to relu
model.compile(loss='categorical_crossentropy', #binary_crossentropy to categorical_crossentropy
              optimizer='rmsprop',
              metrics=['accuracy'])

#from keras.models import load_model
model.load_weights('/content/drive/My Drive/Colab Notebooks/cats-vs-dogs/weights.h5')



from keras.preprocessing import image



#myPic = '/content/drive/My Drive/Colab Notebooks/cats-vs-dogs/data/live/what1.jpg'
myPic = '/content/drive/My Drive/Colab Notebooks/cats-vs-dogs/data/live/table.jpg'
test_image= image.load_img(myPic, target_size = (img_width, img_height)) 
test_image = image.img_to_array(test_image)
test_image = test_image.reshape(input_shape)
test_image = numpy.expand_dims(test_image, axis = 0)
result = model.predict(test_image,verbose=0)  
result = numpy.argmax(result)
print(result)

#myPic2 = '/content/drive/My Drive/Colab Notebooks/cats-vs-dogs/data/live/what2.jpg'
myPic2 = '/content/drive/My Drive/Colab Notebooks/cats-vs-dogs/data/live/what1.jpg'
test_image2= image.load_img(myPic2, target_size = (img_width, img_height)) 
test_image2 = image.img_to_array(test_image2)
test_image2 = test_image2.reshape(input_shape)
test_image2 = numpy.expand_dims(test_image2, axis = 0)
result = model.predict(test_image2,verbose=0)  
result = numpy.argmax(result)
print(result)

