import torch
import torchvision
from torchvision.models.detection import FasterRCNN
from torchvision.models.detection.rpn import AnchorGenerator
from dataset import CustomDataset
import torch.utils.data as data

# Define hyperparameters and configurations
learning_rate = 0.001
num_epochs = 10
batch_size = 16
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

# Initialize custom dataset
dataset = CustomDataset("./Calculadora/images", "./Calculadora/annotations")

# Create data loader
data_loader = torch.utils.data.DataLoader(dataset, batch_size=batch_size, shuffle=True)

# Load a pre-trained model for classification and return only the features
backbone = torchvision.models.mobilenet_v2(pretrained=True).features

# Faster R-CNN needs to know the number of output channels in a backbone.
backbone.out_channels = 1280

# Define anchor generator
anchor_generator = AnchorGenerator(sizes=((32, 64, 128, 256, 512),),
                                   aspect_ratios=((0.5, 1.0, 2.0),))

# Define the region proposal network
roi_pooler = torchvision.ops.MultiScaleRoIAlign(featmap_names=['0'],
                                                output_size=7,
                                                sampling_ratio=2)

# Create the Faster R-CNN model
model = FasterRCNN(backbone,
                   num_classes=len(dataset.classes),rpn_anchor_generator=anchor_generator,
                   box_roi_pool=roi_pooler)
model = model.to(device)

# Define loss function and optimizer
params = [p for p in model.parameters() if p.requires_grad]
optimizer = torch.optim.SGD(params, lr=learning_rate, momentum=0.9, weight_decay=0.0005)

# Train the model
for epoch in range(num_epochs):
    for i, (images, targets_list) in enumerate(data_loader):
        images = [image.to(device) for image in images]
        targets = [{k: v.to(device) for k, v in t.items()} for t in targets_list]


        # Forward pass
        formatted_targets = [{'boxes': t} for t in targets]
        loss_dict = model(images, formatted_targets)



        # Calculate the total loss
        losses = sum(loss for loss in loss_dict.values())

        # Backward pass
        optimizer.zero_grad()
        losses.backward()
        optimizer.step()

        if (i + 1) % 10 == 0:
            print(f'Epoch [{epoch + 1}/{num_epochs}], Step [{i + 1}/{len(data_loader)}], Loss: {losses.item()}')


                  
